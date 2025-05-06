source /usr/app/profiles/dit_profile

kinit pldsap01dy@AD1.PROD

export lob="pl"
export appl="plds"
export comp="home_scorecard"
export Env="lake"
export LOB="pl"
export APPL="plds"

export ATOMIC_DB=${Env}_plds
export MART_DB=${Env}_plds
export MFG_DB=${Env}_plds
export PSTAGE_DB=${Env}_plds
export WORK_DB=${Env}_plds

export Scripts=/tech/appl/default/user/pa08042e/$comp/scripts/
export SHRScripts=/data/lake/plds/dev/code/shared/scripts/

export Config=/tech/appl/default/user/pa08042e/$comp/config
export Logs=/tech/appl/default/user/pa08042e/$comp/logs
export CURR_DATE=$(date +%Y%m%d)

export Autosys_Log=6nacd1bxd_home_scorecard${CURR_DATE}.log
export Autosys_Errlog=6nacd1bxd_home_scorecard${CURR_DATE}.err