source '/app/.profile.d/python.sh'

if [[ -n "${IPYTHON_PASSWORD:+_}" ]]; then
	export IPYTHON_PASSWORD_HASH=$( python -c "from IPython.lib import passwd; print passwd('${IPYTHON_PASSWORD}')" )
fi

# move ipython_notebook_config.py to correct directory
mkdir .ipython/profile_default
mv ipython_notebook_config.py .ipython/profile_default/ipython_notebook_config.py