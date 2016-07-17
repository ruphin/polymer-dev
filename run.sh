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
*)
	echo "polymer $@"
	polymer $@
	;;
esac
