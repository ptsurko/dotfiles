
ENV_FILE=~/.env
BACH_PROFILE_LOCAL_FILE=~/.bach_profile.local

if [ -f $ENV_FILE ]; then
   source ENV_FILE
fi

if [ -f $BACH_PROFILE_LOCAL_FILE ]; then
   source BACH_PROFILE_LOCAL_FILE
fi
