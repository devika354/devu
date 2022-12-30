from flask import Blueprint,render_template,request,redirect,url_for,session,flash
from database import *

public=Blueprint('public',__name__)

@public.route('/',methods=['get','post'])
def login():
    if 'Submit' in request.form:
        uname=request.form['textfield']
        passwd=request.form['textfield2']
        print(uname,passwd)
        q="select * from login where username='%s' and password='%s'"%(uname,passwd)
        print(q)
        res=select(q)
        if res:
            session['lid']=res[0]['id']
            type=res[0]['type']
            print(session['lid'])
            if type=="admin":
                return redirect(url_for('admin.adminhome'))
            elif type=="health":
                q="select * from healthteam where login_id='%s'"%(session['lid'])
                print(q)
                r=select(q)
                session['hid']=r[0]['id']
                return redirect(url_for('health.healthhome'))  
            elif type=="staff":
                q="select * from staff where login_id='%s'"%(session['lid'])
                print(q)
                t=select(q)
                if t:
                    session['sid']=t[0]['id']
                    q="select * from `attendance` where `staff_id`='%s' and `DATE`=curdate()"%(session['sid'])
                    res=select(q)
                    if res:
                        pass
                    else:
                        qr="insert into attendance values(null,'%s',now(),'present')"%(session['sid'])
                        insert(qr)
                    return redirect(url_for('staff.staffhome'))       
            
    return render_template("login.html")