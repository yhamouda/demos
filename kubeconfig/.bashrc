# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
# The Ghost Note Function
function next() {
	local STEP_FILE="demo_steps.txt"

		# Initialize step counter if it doesn't exist
	if [ -z "$DEMO_STEP_COUNTER" ]; then
			export DEMO_STEP_COUNTER=1
	fi

	# Check if the file exists
	if [ ! -f "$STEP_FILE" ]; then
	    echo "Error: demo_steps.txt not found in this directory!"
	    return 1
	fi

	local TOTAL_STEPS=$(grep -c -- "---" "$STEP_FILE")
	echo -e "\n\033[1;34m>>> GHOST NOTE (Step $DEMO_STEP_COUNTER / $((TOTAL_STEPS + 1)))\033[0m"
	awk -v RS="---" -v step="$DEMO_STEP_COUNTER" 'NR==step {print $0}' "$STEP_FILE" | while read -r line; do
		echo -e "\033[0;90m# $line\033[0m"
	done
															    # Increment counter
															    export DEMO_STEP_COUNTER=$((DEMO_STEP_COUNTER + 1))
}

# Simple reset command for when you practice
function demo-reset() {
	export DEMO_STEP_COUNTER=1
	echo "Demo counter reset to Step 1."
}
