use self::handler::{get_humidity, get_temperature};

mod config;
mod handler;

#[cxx_qt::bridge]
pub mod qobject {

    unsafe extern "C++" {
        include!("cxx-qt-lib/qstring.h");
        type QString = cxx_qt_lib::QString;
    }

    unsafe extern "RustQt" {

        #[qobject]
        #[qml_element]
        #[qproperty(f32, temperature)]
        #[qproperty(f32, humidity)]
        type MyObject = super::MyObjectRust;
    }

    unsafe extern "RustQt" {
        #[qinvokable]
        fn temp(self: &MyObject)-> f32;

        #[qinvokable]
        fn hum(self: &MyObject)-> f32;
    }
}

#[derive(Default)]
pub struct MyObjectRust {
    temperature: f32,
    humidity: f32,
}

impl qobject::MyObject {
    pub fn temp(&self) -> f32{
        get_temperature()
    }
    pub fn hum(&self) -> f32{
        get_humidity()
    }
}
