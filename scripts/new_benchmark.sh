OUTPUT_DIRECTORY=data
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/measurements_$RANDOM.txt

touch $OUTPUT_FILE

# Create array of sizes and shuffle them
sizes=(100 1000 10000 100000 1000000 10000000 30000000)
shuffled=($(printf '%s\n' "${sizes[@]}" | shuf))

for i in "${shuffled[@]}"; do
    for rep in `seq 1 30`; do
        echo "Size: $i" >> $OUTPUT_FILE;
        ./src/parallelQuicksort $i >> $OUTPUT_FILE;
    done ;
done
