import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import com.kdab.cxx_qt.demo 1.0

Window {
    id: window
    height: 750
    title: qsTr("Weather")
    visible: true
    width: 1000
    color: "#c6f5ff"

        Timer {
            id: refreshTimer
            interval: 100
            running: true
            repeat: true
            onTriggered: {
                temperature_val.text = qsTr("%1").arg(myObject.temp())
                humidity_val.text = qsTr("%1").arg(myObject.hum())  
            }
        }

    MyObject {
        id: myObject
        temperature : qsTr("%1").arg(myObject.temp())
        humidity: qsTr("%1").arg(myObject.hum())  
    }

    Rectangle{
        id: rectangle_title
        width: parent.width * 0.6
        height: parent.height * 0.1
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.05
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.2
        color: "#c6f5ff"
        Label{
            text: qsTr("Temperature and humidity")
            anchors.centerIn: parent
            font.pixelSize: 40
            color: "#245d8f"
        }
    }

    Rectangle{
        id: rectangle_temp
        width: parent.width * 0.4
        height: parent.height * 0.2
        anchors.top: rectangle_title.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.02
        color: "#82bfdd"
        Label{
            text: qsTr("Temperature")
            anchors.centerIn: parent
            font.pixelSize: 30
            color: "white"
        }
    }

    Rectangle{
        id: rectangle_hum
        width: parent.width * 0.4
        height: parent.height * 0.2
        anchors.top: rectangle_temp.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.02
        color: "#82bfdd"
        Label{
            text: qsTr("Humidity")
            anchors.centerIn: parent
            font.pixelSize: 30
            color: "white"
        }
    }

    Rectangle{
        id: rectangle_temp_val
        width: parent.width * 0.25
        height: parent.height * 0.2
        anchors.top: rectangle_title.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: rectangle_temp.right
        anchors.leftMargin: parent.width * 0.02
        color: "#82bfdd"
        Label{
            id: temperature_val
            text: qsTr("%1").arg(myObject.temperature)
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectangle_hum_val
        width: parent.width * 0.25
        height: parent.height * 0.2
        anchors.top: rectangle_temp_val.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: rectangle_hum.right
        anchors.leftMargin: parent.width * 0.02
        color: "#82bfdd"
        Label{
            id: humidity_val
            text: qsTr("%1").arg(myObject.humidity)
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectangle_C
        width: parent.width * 0.2
        height: parent.height * 0.2
        anchors.top: rectangle_title.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: rectangle_temp_val.right
        anchors.leftMargin: parent.width * 0.02
        color: "red"
        Label{
            text: qsTr("°C")
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }

    Rectangle{
        id: rectangle_percent
        width: parent.width * 0.2
        height: parent.height * 0.2
        anchors.top: rectangle_C.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: rectangle_hum_val.right
        anchors.leftMargin: parent.width * 0.02
        color: "red"
        Label{
            text: qsTr("%")
            anchors.centerIn: parent
            font.pixelSize: 30
        }
    }
}
