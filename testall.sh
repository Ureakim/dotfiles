#!/bin/bash

set -e  # Exit on first error

ROLES_DIR="net/ureakim/roles"

for role in "$ROLES_DIR"/*/; do
    if [ -d "${role}molecule" ]; then
        echo "🔍 Testing role: $(basename "$role")"
        cd "$role"
        molecule test
        cd - > /dev/null
    else
        echo "⚠️  No Molecule scenario found for $(basename "$role"), skipping."
    fi
done

echo "✅ All Molecule tests completed."
