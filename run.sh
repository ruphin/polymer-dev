#!/usr/bin/env bash
cd /app

# Install Bower packages
if [ -f /app/bower.json ]; then
	bower install
fi

case "$1" in
shell)
	echo "Dropping to shell"
	exec bash
	;;
serve)
	echo "Serving app"
	shift
	polymer serve -H $(ip addr | grep eth0 | awk '{print $2}' | egrep -o '([0-9]+\.){3}[0-9]+') $@
*)
	echo "polymer $@"
	polymer $@
	;;
esac
