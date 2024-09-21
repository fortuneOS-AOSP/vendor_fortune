#!/system/bin/sh

# Cache cleaner to prevent mangled resources

#
# Save build date property to prop and compare to check whether ota update has been done
#
function cleaning_cache() {
    # Get previous and current build date
    local build_prev_prop="persist.prev.build.date.utc"
    local build_date_prop="ro.system.build.date.utc"
    local build_date_prev=`getprop $build_prev_prop`
    local build_date_curr=`getprop $build_date_prop`

    if [[ $build_date_prev -lt 1 ]]; then
        # As previous build date was not saved,
        # Check whether device provisioned
        local device_provisioned=`getprop persist.sys.device_provisioned`
        if [ "$device_provisioned" != "1" ]; then
            # Set value to ro.system.build.date.utc
            # so that we can avoid cleaning caches before provision
            setprop $build_prev_prop $build_date_curr
        else 
            # Set value to 0
            # in case this script is added after provision
            setprop $build_prev_prop 0
        fi
    fi

    # Check previous build date again
    build_date_prev=`getprop $build_prev_prop`

    # Compare build date before clean-up
    if [ $build_date_curr != $build_date_prev ]; then
        # Remove caches to avoid derps after dirty flash
        rm -rf /data/cache /data/resource-cache /data/system/package_cache
        # Update previous build date prop
        setprop $build_prev_prop $build_date_curr
    fi
}

cleaning_cache
