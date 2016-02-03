#!/bin/bash
set -o errexit

# Bootstrap and exit if KOLLA_BOOTSTRAP variable is set. This catches all cases
# of the KOLLA_BOOTSTRAP variable being set, including empty.
if [[ "${!KOLLA_BOOTSTRAP[@]}" ]]; then
    manila-manage db sync
    #sudo chown -R manila: /var/lib/manila/
    #sudo chown -R manila: /var/cache/manila
    exit 0
fi
