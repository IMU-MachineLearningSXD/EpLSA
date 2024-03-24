########################
#### Run experiment
########################

DATASET=${}
INPUT_DIR=${}
OUTPUT_DIR=${}

option="
    --data_dir data/eg
    --model_name_or_path facebook/bart-base  
    --model_type moe
    --output_dir eg
    --max_source_length 40
    --max_target_length 40
    --val_max_target_length 40
    --test_max_target_length 40
    --num_train_epochs 30
    --learning_rate 3e-5
    --alpha 0.1
    --do_sample
    --top_p 0.95
    --beta 0.1
    --do_train 
    --do_eval
    --eval_beams 3 
    --per_device_train_batch_size 15
    --per_device_eval_batch_size 15
    --metric_for_best_model topk_bleu_4
    --predict_with_generate 
    --load_best_model_at_end 
    --overwrite_output_dir 
    --evaluate_during_training
"

cmd="python3 main.py ${option}"

echo $cmd
eval $cmd
