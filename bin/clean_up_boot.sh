# Ubuntu has a stupid policy of not cleaning up boots because they deem
# unknowable whether a kernel is valid or not (even if booted). Combined with
# the default Ubuntu setup that creates a ridiculously small /boot that is
# bound to be filled in a few months worth of updates, you have a recipe for a
# failure during upgrade, leading to being unable to update or remove anything
# and having to mess with apt and dpkg innards by hand.
# This may work for Debian too.

# This one liner keeps /boot fresh and clean by removing the currently
# running kernel version as well as the latest one (which may not be
# the same) and is supposed to be run regularly (possibly even by cron).
dpkg -l | awk '{ print $2 }' | egrep '^linux-image-[0-9]+' | grep -v $(uname -r) | grep -v $(dpkg -l | awk '{ print $2 }' | egrep '^linux-image-[0-9]+' | sort | tail -1) | xargs sudo apt-get remove --purge -y

# This one liner removes files not associated with the currently running
# kernel version as well as the latest one (which may not be the same) and
# is supposed to be run only in case of emergency, when apt-get refuses to
# because a package has been installed halfway and dependencies are b0rked.
dpkg -l | awk '{ print $2 }' | egrep '^linux-image-[0-9]+' | grep -v $(uname -r) | grep -v $(dpkg -l | awk '{ print $2 }' | egrep '^linux-image-[0-9]+' | sort | tail -1) | sed 's/^linux-image-//' | while read version; do sudo rm -v /boot/*-$version; done

# As noted before, sometimes dpkg is so in over its head that you may have
# to resort to things like:
sudo apt-get -f remove --purge linux-image-3.2.0-86-generic linux-headers-server=3.2.0.91.105 linux-server linux-image-3.2.0-86-generic linux-image-generic linux-image-server linux-server linux-image-generic=3.2.0.86.100 linux-image
# before doing any other dpkg removal. You will have to find the culprit
# versions by hand, which dpkg happily gives when trying to remove the
# non-versioned ones. Don't forget to do:
sudo apt-get install linux-image linux-server linux-image-server linux-image-generic
# afterwards, or you risk having no kernel.
