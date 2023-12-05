# Sunfetch

A simple app to get sunrise/sunset information from the command line.

## Preparation

Create a new file called `src/Secrets.hx`

```hx
class Secrets {
	public static final API_KEY = "place your ipgeolocation.io api key here";
}
```

## Building

Install [haxe](https://haxe.org)

Run `haxe build.hxml`

## Installation

Copy `./bin/Main` to `/usr/local/bin/sunfetch`
