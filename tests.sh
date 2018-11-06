set -xe

python component_inference_1_preprocess.py \
--inputDataFolder "../DSB2017_Data/DSB3/stage1_samples" \
--outputDataFolder "output_data" \
--outputImagesFolder "output_images" \
--outputData "data/data_1.csv"

python component_inference_2_n_net.py \
--inputData "data/data_1.csv" \
--inputDataFolder "output_data" \
--inputModel "dsb/model/detector.ckpt" \
--outputBboxData "data/data_2.csv" \
--outputBboxFolder "output_bbox" \
--idColumn "patient"

python component_inference_3_mask.py \
--inputData "data/data_2.csv" \
--inputDataFolder "output_data" \
--inputBboxDataFolder "output_bbox" \
--outputImageFolder "output_nodules" \
--idColumn "patient"
