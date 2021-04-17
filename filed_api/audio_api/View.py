from audio_api.Main import *


# app.add_url_rule('/api/get_paths','get_paths',insert_audio,methods=['POST','GET'])
# app.add_url_rule('/api/count','count',count,methods=['GET'])

app.add_url_rule('/audio/api/insert_record','insert_audio',insert_audio,methods=['POST'])
app.add_url_rule('/audio/api/delete_record/<int:id>/<FileType>','delete_records',delete_records,methods=["DELETE"])
app.add_url_rule('/audio/api/update_record/<int:id>','update_record',update_record,methods=["PUT"])
app.add_url_rule('/audio/api/get_record','get_records',get_records,methods=["GET"])



