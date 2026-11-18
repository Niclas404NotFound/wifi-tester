# 🛜 Wifi-Tester 🛜

## A wifi-tester to test a certain wifi

### Android
1. Make sure you have [Termux](https://play.google.com/store/apps/details?id=com.termux) installed.
2. Install git inside of Termux:
```bash
pkg update && pkg upgrade -y
pkg install git -y
```
3. Install ab inside of Termux:
```bash
pkg install apache2 -y
```
4. Check if ab is installed:
```bash
ab -V
```
5. Clone the repository:
```bash
git clone https://github.com/Niclas404NotFound/wifi-tester.git
cd wifi-tester
```
6. Run the script:
```bash
chmod +x ./run.sh
./run.sh -n REQUESTS -c CONCURRENCY [-r ROUNDS] URL
```
7. Example usage:
```bash
# 10 times
./run.sh -n 100 -c 1 -r 10 https://example.com/

# infinite times
./run.sh -n 100 -c 1 https://example.com/
```

### ios
1. Make sure you have [iSH Shell](https://apps.apple.com/us/app/ish-shell/id1436902243) installed.
2. Install git inside of iSH:
```bash
apk update
apk add git
```
3. Install ab inside of iSH:
```bash
apk add apache2-utils
```
4. Check if ab is installed:
```bash
ab -V
```
5. Clone the repository:
```bash
git clone https://github.com/Niclas404NotFound/wifi-tester.git
cd wifi-tester
```
6. Run the script:
```bash
chmod +x ./run.sh
./run.sh -n REQUESTS -c CONCURRENCY [-r ROUNDS] URL
```
7. Example usage:
```bash
# 10 times
./run.sh -n 100 -c 1 -r 10 https://example.com/

# infinite times
./run.sh -n 100 -c 1 https://example.com/
```
