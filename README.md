<!-- ltex: enabled=true -->

# SRMC Laboratory 2024/2025

## Setup

### Step 1: Install Docker and Compose

Follow the instructions on the [Docker documentation page](https://docs.docker.com/get-started/get-docker/).

On Windows and macOS, you should use Docker Desktop, [for Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
and [for Mac](https://docs.docker.com/desktop/setup/install/mac-install/), respectively.

On Linux, I suggest you just [install Docker Engine](https://docs.docker.com/engine/install/).
You'll also need to [install the Docker Compose plugin](https://docs.docker.com/compose/install/linux/#install-using-the-repository).

Finally, verify that everything is installed correctly by running the following commands.

```shell
docker version
docker compose version
```

### Step 2: Start Cheshire Cat

Create a `compose.yaml` like the one you find in the root of this repository.
(If you cloned the repository, you don't need to create a new file, just use the one provided).

Start the Cat by running the following command in the same directory where the `compose.yaml` file is located.

```shell
docker compose up
```

If you see the following screen, the Cat has started correctly.

<p align="center">
  <picture>
    <img
      alt="Screenshot of a terminal with the Cat startup completed."
      width="560"
      src="https://raw.githubusercontent.com/BuriedInTheGround/srmc-lab/main/assets/cat-startup-complete.png"
    >
  </picture>
</p>

> [!TIP]
> You can update the Docker image of the Cat at any time by running the following command.
> ```shell
> docker pull ghcr.io/cheshire-cat-ai/core
> ```

### Step 3: Obtain an API key from an LLM service

You can choose whatever LLM provider you prefer. In the following, instructions for Google Gemini are given,
since it has a [free](https://ai.google.dev/gemini-api/docs/pricing) [tier](https://ai.google.dev/gemini-api/docs/rate-limits).

You can [get a Gemini API key](https://aistudio.google.com/app/apikey) in Google AI Studio.

> [!TIP]
> The Gemini API documentation lists [the available models](https://ai.google.dev/gemini-api/docs/models/gemini).
>
> You can view your quota and limits [in the Google Cloud console](https://console.cloud.google.com/apis/api/generativelanguage.googleapis.com/quotas).

### Step 4: Install Ollama (optional, for local LLMs)

Follow the instructions on the [Ollama download page](https://ollama.com/download).

Verify that it is installed correctly by running the following command.

```shell
ollama --version
```

If you see the message `Warning: could not connect to a running Ollama instance`,
you'll need to start Ollama manually by running the following command.

```shell
ollama serve
```

> [!WARNING]
> Depending on your environment, you may need to tinker with the Ollama configuration
> to get it to work properly with Cheshire Cat.
> See the [Ollama FAQ](https://github.com/ollama/ollama/blob/main/docs/faq.md) for help.
>
> Personally, I use the following command on my Linux machine.
> ```shell
> OLLAMA_HOST=0.0.0.0:11434 ollama serve
> ```

### Step 5: Download a local model with Ollama (optional, for local LLMs)

Download a local LLM model by running the following command.

```shell
ollama pull qwen2.5:7b
```

Replace `qwen2.5:7b` with your preferred model and size.

> [!TIP]
> You can browse through the list of models offered by Ollama [on their website](https://ollama.com/search).

> [!NOTE]
> As a rule of thumb, you should have at least 8 GB of RAM available to run the
> 7B models, 16 GB to run the 13B models, and 32 GB to run the 33B models.
