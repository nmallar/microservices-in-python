import socket
from flask import Flask, jsonify, render_template
app= Flask(__name__)


def fetchDetails():
    try:
        host_name=socket.gethostname()
        host_ip=socket.gethostbyname(host_name)
    except:  # noqa: E722
        print("Unble to get Hostname and IP")
        
    return {'hostname':host_name,'host_ip':host_ip }

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/health")
def health():
    return jsonify(
        status="UP"
    )
    
@app.route("/details")
def details():
    host_details=fetchDetails()
    
    return render_template('index.html',host_name=host_details['hostname'],host_ip=host_details['host_ip'])


if __name__=='__main__':
    app.run(host='0.0.0.0',port=5000)