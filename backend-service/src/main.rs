use gotham::router::{builder::*, Router};
use gotham::state::State;
use hyper::{Body, Response, StatusCode};
use gotham::helpers::http::response::create_response;
use rand::prelude::*;

const GREETINGS: [&str; 6] = [
    "Hello",
    "Hi",
    "Hey",
    "bonjour",
    "buenos dias",
    "aloha"
];

const FAREWELLS: [&str; 6] = [
    "Goodbye",
    "Bye",
    "Farewell",
    "adios",
    "toodle-oo",
    "ciao"
];

fn say_hello(state: State) -> (State, Response<Body>) {
    let mut rng = thread_rng();
    let greeting = GREETINGS[(GREETINGS.len() as f32 * rng.gen_range(0.0, 1.0)) as usize];
    let mut res = create_response(&state, StatusCode::OK, mime::TEXT_PLAIN, greeting);
    {
        let headers = res.headers_mut();
        headers.insert("Access-Control-Allow-Origin", "*".parse().unwrap());
    }
    (state, res)
}

fn say_goodbye(state: State) -> (State, Response<Body>) {
    let mut rng = thread_rng();
    let goodbye = FAREWELLS[(FAREWELLS.len() as f32 * rng.gen_range(0.0, 1.0)) as usize];
    let mut res = create_response(&state, StatusCode::OK, mime::TEXT_PLAIN, goodbye);
    {
        let headers = res.headers_mut();
        headers.insert("Access-Control-Allow-Origin", "*".parse().unwrap());
    }
    (state, res)
}

fn build_hello_world() -> Router {
    build_simple_router(|route| {
        route.get("/hi").to(say_hello);
        route.get("/bye").to(say_goodbye);
    })
}

fn main() {
    let addr = "0.0.0.0:8080";
    println!("Listening for requests on http://{}", addr);
    gotham::start(addr, build_hello_world())
}