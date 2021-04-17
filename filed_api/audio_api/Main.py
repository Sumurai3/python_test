from audio_api import request,jsonify,connection as conn
from sqlalchemy import create_engine
import pandas as pd

cur=conn.cursor()



def insert_audio():

    try:
        if request.method=="POST":


            data=request.get_json()
            file_type=data['FileType']
            file_meta=data['MetaData']
            df = pd.json_normalize(file_meta)
            print(df)
            engine = create_engine('mysql+pymysql://root:Sumit@123@localhost/AudioFiles')
            df.to_sql(name="{}".format(file_type),con=engine,if_exists="append",index=False)
            return jsonify({"Message":"Data Inserted","Status":200})
        # if request.method=="UPDATE":

    except Exception as e:

        return jsonify({"Message": "Something Went Wrong", "Status": 500})

def delete_records(id,FileType):
    try:
        if request.method=="DELETE":
            cur.execute("delete from {} where ID={}".format(FileType,id))
            cur.connection.commit()
            return jsonify({"Message":"Record Deleted","Status":200})
    except Exception as e:

        return jsonify({"Message": "Something Went Wrong", "Status": 500})

def update_record(id):
    try:
        if request.method=="PUT":
            data = request.get_json()
            file_type = data['FileType']
            file_meta = data['MetaData']
            cur.execute("delete from {} where ID={}".format(file_type,id))
            cur.connection.commit()
            df = pd.json_normalize(file_meta)
            engine = create_engine('mysql+pymysql://root:Sumit@123@localhost/AudioFiles')
            df.to_sql(name="{}".format(file_type),con=engine,if_exists="append",index=False)
            return jsonify({"Message":"Record Updated","Status":200})
    except Exception as e:

        return jsonify({"Message": "Something Went Wrong", "Status": 500})

def get_records():
    try:
        if request.method=="GET":
            id = request.args.get('audioFileID', default = None)
            filetype=request.args.get('audioFileType')

            if not id:
                cur.execute("Select * from {}".format(filetype))
                res=cur.fetchall()
            else:

                cur.execute("Select * from {} where ID={}".format(filetype,id))
                res=cur.fetchall()
            return jsonify({"Data":res,"Message":"Records Shown","Status":200})

    except Exception as e:

        return jsonify({"Message": "Something Went Wrong", "Status": 500})