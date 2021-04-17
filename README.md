# python_test
Added triggers to make sure Upload date is in future.
The database structure is provided with the files.
Below are some examples of url construction for update/get/delete/insert operations.
Update-http://127.0.0.1:5000/audio/api/update_record/<int:id> or http://127.0.0.1:5000/audio/api/update_record/<1>
Get-http://127.0.0.1:5000/audio/api/get_record?audioFileType=podcasts&audioFileID=1
Insert-http://127.0.0.1:5000/audio/api/insert_record
Delete-http://127.0.0.1:5000/audio/api/delete_record/<id>/<FileType> or http://127.0.0.1:5000/audio/api/delete_record/5/podcasts
