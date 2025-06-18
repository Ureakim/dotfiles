#!/bin/bash

set -e  # Exit on first error

ROLES_DIR="net/ureakim/roles"
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Check if a role name is provided as an argument
if [ $# -gt 0 ]; then
	# Test only the specified role
	role_path="$ROLES_DIR/$1"
	if [ -d "$role_path" ]; then
		if [ -d "${role_path}/molecule" ]; then
			echo "🔍 Testing role: $1"
			cd "$role_path"
			molecule test --all
			cd - > /dev/null
		else
			printf "⚠️ ${YELLOW} No Molecule scenario found for ${1}, skipping.${NC}\n"
		fi
	else
		printf "❌ ${RED} Role ${1} not found in ${ROLES_DIR} ${NC}\n"
		exit 1
	fi
else
	for role in "$ROLES_DIR"/*/; do
		if [ -d "${role}molecule" ]; then
			echo "🔍 Testing role: $(basename "$role")"
			cd "$role"
			molecule test --all
			cd - > /dev/null
		else
			printf "⚠️ ${YELLOW} No Molecule scenario found for $(basename "$role"), skipping.${NC}\n"
		fi
	done

	echo "✅ All Molecule tests completed."
fi

