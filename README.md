# Rust Weather Server with Cxx-Qt Integration

![k6JFxu2](https://github.com/alichlaifa/Rust-weather-monitor-server/assets/128910925/ce442427-32a8-46e8-8a04-c9c7b0e7286f)

## Overview

The Rust Weather Server is a server-side application written in Rust that handles weather-related data, leveraging the Cxx-Qt library for seamless interoperability with Qt-based applications. It provides an API for retrieving temperature and humidity information from sensors.

## Key Features

- **Temperature and Humidity API:** Retrieve real-time temperature and humidity data.
- **Rust Implementation:** Built using the Rust programming language for performance and safety.
- **Cxx-Qt Integration:** Utilizes the Cxx-Qt library to bridge Rust and Qt, enabling Rust components to interact with Qt elements.

## Getting Started

### Prerequisites

- Rust (>=1.50.0): [Install Rust](https://www.rust-lang.org/tools/install)
- Cxx-Qt Library: Install the Cxx-Qt library according to its documentation (https://github.com/KDAB/cxx-qt).
- Cargo (Rust Package Manager): Included with Rust installation.

### Installation

1. Clone the repository:

   ```bash
   git clone git@github.com:alichlaifa/Rust-weather-monitor-server.git
   cd rust-weather-server
   

2. Configure IP and Port:

   Update the config.rs file with the desired IP address and port. This file is typically located in the src/config directory.

3. Build the project:

   ```bash
   cargo build --release

4. Run the server:

   ```bash
   cargo run
