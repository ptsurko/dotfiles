
ENV_FILE=~/.env
BASH_PROFILE_LOCAL_FILE=~/.bach_profile.local

if [ -f $ENV_FILE ]; then
   source ENV_FILE
fi

if [ -f $BASH_PROFILE_LOCAL_FILE ]; then
   source BASH_PROFILE_LOCAL_FILE
fi
