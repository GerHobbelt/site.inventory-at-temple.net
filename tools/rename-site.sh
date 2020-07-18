#! /bin/bash
#
# argv1: <website name>
# 

pushd $( dirname $0 )
pwd
cd ..
pwd


if test -z "$@" ; then
	cat <<EOT

./tools/rename-site.sh <website-name>

Rename the website to the given name.

EOT
else
	for f in $( grep -l 'bermuda-holding.com' * **/* ) ; do
		echo "checking: $f"
		if [[ $f != *"rename-site.sh" ]] ; then
			echo "editing: $f"
			cat "$f" | sed -e "s/bermuda-holding\\.com/$@/" > tmp
			cat tmp > $f
		fi
	done
fi

popd

