
# Variables
TARGETS=();
TARGETTED=$1;

# Collect & Request Target
if [ -z "${TARGET}" ]; then
  for DEV_FILE in ./dev/*; do
    DEV_FILE=$(echo $DEV_FILE | sed 's/\.\/dev\///' | sed 's/\.sh//');
    TARGETS+=("$DEV_FILE");
  done

  echo "make-script(): select [#]"
  I_CNT_MAKE_1=0;
  for TARGET in ${TARGETS[@]}; do
    echo "[$I_CNT_MAKE_1] $TARGET";
    I_CNT_MAKE_1=$((I_CNT_MAKE_1 + 1));
  done
  echo "";
fi

# Read Target
while [ -z "${FTARG}" ]; do
  read -p "Target [#]: " TARGETTED;
  FTARG=${TARGETS[$TARGETTED]};
done

# Execute Task
echo "";
bash ./dev/$FTARG.sh $FTARG;

# Capture Exit
EXIT_CODE=$?;
echo "Exit: $EXIT_CODE";
exit $EXIT_CODE;