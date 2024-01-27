use std::{io::{Read, Write}, net::{TcpListener, TcpStream}};
use url::Url;
use super::config::{IP, PORT};

pub fn handle_connection(mut stream: TcpStream) -> (f32, f32) {
    let mut temperature = 0.0;
    let mut humidity = 0.0;

    let mut buffer = [0; 1024];
    if let Ok(_) = stream.read(&mut buffer) {
        let request = String::from_utf8_lossy(&buffer);

        if request.starts_with("GET /") && !request.contains("favicon.ico") {
            if let Some(start) = request.find("GET /") {
                if let Some(end) = request[start..].find(" HTTP/1.1") {
                    let path = &request[start + 4..start + end];
                    let base_url = format!("http://{}{}", IP, path);

                    if let Ok(url) = Url::parse(&base_url) {
                        if let Some(temperature_query) = url.query_pairs().find(|(key, _)| key == "temperature") {
                            if let Ok(value) = temperature_query.1.to_string().parse::<f32>() {
                                temperature = value;
                            }
                        }
                        if let Some(humidity_query) = url.query_pairs().find(|(key, _)| key == "humidity") {
                            if let Ok(value) = humidity_query.1.to_string().parse::<f32>() {
                                humidity = value;
                            }
                        }
                    }
                }
            }
        }
    }

    if let Ok(_) = stream.flush() {
    } else {
        eprintln!("Error flushing stream");
    }
    (temperature, humidity)
}


pub fn get_temperature() -> f32 {
    let address = format!("{}:{}", IP, PORT);
    let listener = TcpListener::bind(&address).unwrap();

    for stream in listener.incoming() {
        let stream = stream.unwrap();
        let (temperature, _) = handle_connection(stream);
        return temperature;
    }
    0.0
}

pub fn get_humidity() -> f32 {
    let address = format!("{}:{}", IP, PORT);
    let listener = TcpListener::bind(&address).unwrap();

    for stream in listener.incoming() {
        let stream = stream.unwrap();
        let (_, humidity) = handle_connection(stream);
        return humidity;
    }
    0.0
}


