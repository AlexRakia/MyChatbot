rem docker remove OLLama
@Echo.
rem docker run -d            -v S:\My-GitHub\MyAIchatbot\AI\ollama:/root/.ollama -p 11434:11434 --name OLLama ollama/ollama:latest
    docker run -d --gpus=all -v S:\My-GitHub\MyAIchatbot\AI\ollama:/root/.ollama -p 11434:11434 --name OLLama ollama/ollama:latest
@Echo.

@REM docker run -d ^
@REM   --name OLLama ^
@REM   -p 11434:11434 ^
@REM   -v ollama_volume:/root/.ollama ^
@REM   ollama/ollama:latest

timeout 5

docker remove Open-WebUI
@Echo.
docker run -d ^
  -p 3004:8080 ^
  --add-host=host.docker.internal:host-gateway ^
  -v S:\My-GitHub\MyAIchatbot\AI\open-webui:/app/backend/data ^
  --name Open-WebUI ^
  --restart always ^
  ghcr.io/open-webui/open-webui:main
@Echo.

@REM References:
@REM   https://collabnix.com/how-to-setup-ollama-with-ollama-webui-using-docker-compose/
@REM   https://medium.com/@researchgraph/how-to-run-ollama-on-windows-8a1622525ada
@REM   https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation
@REM   docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama

timeout 10
