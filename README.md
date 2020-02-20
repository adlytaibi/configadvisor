# Run NetApp ConfigAdvisor inside a Docker container

## Pre-requisites

* git
* docker

## Installation

1. Clone this:

    ```
    git clone https://github.com/adlytaibi/configadvisor
    cd configadvisor
    ```

2. Extract ConfigAdvisor here.

    ```
    tar zxvf ~/Active_IQ_Config_Advisor_x.y_Linux64.tar.gz
    ```

3. Build

   ```
   docker build . -t ca
   ```

4. Start container

   ```
   docker run -d -p 8888:443 -v $(pwd)/NetApp:/NetApp --name ca -t ca 
   ```

5. Point your internet browser to `http://localhost:8888`

6. (Optional) SSL certificates, use nginx_ssl.conf in Dockerfile and uncomment the two `COPY` lines

    ```
    mkdir sslkeys
    ```

    1. Create private key, generate a certificate signing request

        ```
        openssl genrsa -out ndmc/sslkeys/host.key 2048
        ```

    2. Self-sign your own certificates: (modify `web` to match your server)

        ```
        openssl req -x509 -nodes -newkey rsa:4096 -keyout sslkeys/host.key -out sslkeys/host.pem -days 365 -subj "/C=CA/ST=Ontario/L=Ottawa/O=Storage/OU=Team/CN=ConfigAdvisor"
        ```

    3. As above build/start container, then point your internet browser to `https://localhost:8888`

## Notes
This is not an official NetApp repository. NetApp Inc. is not affiliated with the posted examples in any way.

```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
