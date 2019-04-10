canAwait=$(node -e "console.log(require('compare-versions')(process.version, '7.6.0'))")
canDetectHandles=$(node -e "console.log(require('compare-versions')(process.version, '8'))")

if [ $canDetectHandles == "1" ]; then
    testcmd="jest --detectOpenHandles" # --runInBand --verbose"
else
    testcmd="jest"
fi

if [ $canAwait == "1" ]; then
    eval $testcmd
else
    eval $testcmd --testPathIgnorePatterns=concurrency/await.*
fi
