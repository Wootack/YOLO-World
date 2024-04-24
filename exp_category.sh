#!/bin/bash
root="/data/coco/lvis/categories"
find "$root" -type f -print0 | sort -z | while IFS= read -r -d '' file; do
    echo "$file"
    python image_demo.py configs/pretrain/yolo_world_v2_s_vlpan_bn_2e-3_100e_4x8gpus_obj365v1_goldg_train_lvis_minival.py /data/yoloworld_checkpoints/yolo_world_v2_s_obj365v1_goldg_pretrain-55b943ea.pth /data/coco/val2017/000000135872.jpg "$file"
    python image_demo.py configs/pretrain/yolo_world_v2_m_vlpan_bn_2e-3_100e_4x8gpus_obj365v1_goldg_train_lvis_minival.py /data/yoloworld_checkpoints/yolo_world_v2_m_obj365v1_goldg_pretrain-c6237d5b.pth /data/coco/val2017/000000135872.jpg "$file"
    python image_demo.py configs/pretrain/yolo_world_v2_l_vlpan_bn_2e-3_100e_4x8gpus_obj365v1_goldg_train_lvis_minival.py /data/yoloworld_checkpoints/yolo_world_v2_l_obj365v1_goldg_pretrain-a82b1fe3.pth /data/coco/val2017/000000135872.jpg "$file"
    python image_demo.py configs/pretrain/yolo_world_v2_x_vlpan_bn_2e-3_100e_4x8gpus_obj365v1_goldg_train_lvis_minival.py /data/yoloworld_checkpoints/yolo_world_v2_x_obj365v1_goldg_cc3mlite_pretrain-8698fbfa.pth /data/coco/val2017/000000135872.jpg "$file"
done
