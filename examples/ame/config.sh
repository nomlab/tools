# Value of DEFAULT_TOKEN_NAME should be lower-case:
#
#   DEFAULT_TOKEN_NAME="nomlab"
#
# This is used for the default argument of ame -t option.

DEFAULT_TOKEN_NAME="nomlab"

# Variable name TOKEN_* should be upper-case:
#
#   ame -t nomlab
#
# will use the value of TOKEN_NOMLAB.
#
#   TOKEN_NOMLAB="xoxp-XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX-XXXXXX"
#
# Since each token is bound to workspace+user, so
# you may want to setup multiple tokens like:
#
# for user nom@nomlab
#   TOKEN_NOMLAB="xoxp-XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX-XXXXXX"
#
# for user nomrat@nomlab (bot)
#   TOKEN_NOMRAT="xoxp-YYYYYYYYYY-YYYYYYYYYY-YYYYYYYYYY-YYYYYY"
#
# for user nom@anone
#   TOKEN_ANONE="xoxp-ZZZZZZZZZZ-ZZZZZZZZZZ-ZZZZZZZZZZ-ZZZZZZ"
#
# !! Legacy tokens are just for you !!
#
# Never share legacy tokens with other users or applications.
# You can get your Legacy token from after logged in:
#   https://api.slack.com/custom-integrations/legacy-tokens

TOKEN_NOMLAB="xoxp-XXXXXXXXXX-XXXXXXXXXX-XXXXXXXXXX-XXXXXX"
TOKEN_NOMRAT="xoxp-YYYYYYYYYY-YYYYYYYYYY-YYYYYYYYYY-YYYYYY"
