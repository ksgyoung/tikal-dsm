
export LAS_DIR=~/installations/LAStools/bin/
export HIVE_DIR=~/repositories/personal/hive/

wine $LAS_DIR/e572las -v -i $HIVE_DIR/data/tikal/Tikal.e57 -o $HIVE_DIR/data/tikal/Tikal.laz

wine $LAS_DIR/lasinfo -i $HIVE_DIR/data/tikal/Tikal.laz -odix _info -otxt

wine $LAS_DIR/lasground -i $HIVE_DIR/data/tikal/Tikal.laz -archeology -o $HIVE_DIR/data/tikal/Tikal_ground.laz

wine $LAS_DIR/lasheight -i $HIVE_DIR/data/tikal/Tikal_ground.laz -o $HIVE_DIR/data/tikal/Tikal_height.laz

wine $LAS_DIR/lasclassify -i $HIVE_DIR/data/tikal/Tikal_height.laz -small_buildings -small_trees -step 1.0 -o $HIVE_DIR/data/tikal/Tikal_classify.laz

wine $LAS_DIR/lasnoise -i $HIVE_DIR/data/tikal/Tikal_classify.laz -isolated 15 -step 2.0 -remove_noise -o $HIVE_DIR/data/tikal/Tikal_classify_no_noise.laz

wine $LAS_DIR/lasthin -i $HIVE_DIR/data/tikal/Tikal_classify_no_noise.laz -step 0.2 -o $HIVE_DIR/data/tikal/Tikal_classify_thin.laz

wine $LAS_DIR/las2las -i $HIVE_DIR/data/tikal/Tikal_classify_thin.laz -drop_class 5 1 -o $HIVE_DIR/data/tikal/Tikal_clean_class.laz

wine $LAS_DIR/lasnoise -i $HIVE_DIR/data/tikal/Tikal_clean_class.laz -isolated 15 -step 2.0 -remove_noise -o $HIVE_DIR/data/tikal/Tikal_for_dem.laz

wine $LAS_DIR/blast2dem -i $HIVE_DIR/data/tikal/Tikal_for_dem.laz -hillshade -scale 2.0 -step 0.3 -kill 10 -o $HIVE_DIR/data/tikal/Tikal_dem2.asc -v
