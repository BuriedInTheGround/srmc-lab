# Demo (template)

- LLM
    - Model: models/gemini-2.0-flash
    - Temperature: 0.2
    - Top P: 0.8
    - Top K: 40
    - Max Output Tokens: 6200
- Embedder
    - Model: models/text-embedding-004
- Episodic Memory
    - K: 3
    - Threshold: 0.5
- Declarative Memory
    - K: 24
    - Threshold: 0.5
- Procedural Memory
    - K: 3
    - Threshold: 0.7

## Company generation

_Clean memory_

**Prompt prefix**

```
You are an expert in organizational structure. When asked to describe a fictitious organization, you can do so in a realistic way. You always follow the initial prompt given by Human. You answer Human with a focus on the following context.
```

**Requests**

```
Who are you?
```

```
Describe a fictitious organization. Initial prompt: "ACME is a company that specializes in building diagnostic equipment for the automotive industry. At its headquarters, it designs and manufactures both the hardware components and the software for each of the devices it markets."
```

```
Create a simplified Organizational Chart for the ACME company.
```

## Assessment generation

_Clean memory_

**Prompt prefix**

```
You are cybersecurity expert with a focus on assessing cybersecurity risks and writing reports based on the NIST Cybersecurity Framework version 2.0. Currently, you are analyzing the following company.

<company>
INSERT DATA HERE
</company>

You answer Human with a focus on the following context.
```

_Upload NIST CSF_

**Requests**

```
Who are you?
```

```
Which company are you currently working with?
```

```
Provide the Organizational Chart of ACME
```

```
1. Identify five Categories from the NIST CSF that are appropriate for the ACME company.
    - The five selected Categories must belong to different CSF Functions.
    - Double-check the correspondence between a Category name and its identifier.
2. Provide a thoughtful motivation (at least 50 words) for each Category selected.
```

```
1. For each of the following five CSF Categories, select two Subcategories from the NIST CSF that are appropriate for the ACME company. Double-check the correspondence between a Subcategory name and its identifier.
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
2. Do not provide any motivation or additional information about your choices.
```

_Upload Implementation Examples_

**Requests**

```
1. For each of the following ten CSF Subcategories, write a thoughtful paragraph (at least 100 words) detailing the current state of implementation for the company under analysis.
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
    - INSERT DATA HERE
2. Do not copy verbatim from the implementation examples. Use the implementation examples only as inspiration. Be creative and realistic.
```

```
1. Analyze the following cybersecurity assessment for the company under analysis,
2. Write a summary of the current cybersecurity posture of the company. This must correspond to the so-called Organizational Profile of the NIST CSF.
3. Determine the NIST CSF Tier that the company should apply.

<assessment>
INSERT DATA HERE
</assessment>
```

## Report beautifier

_Do NOT clean memory: keep episodic, NIST CSF, and Implementation Examples_

_Do NOT change the Prompt prefix_

_Clean chat history_

**Requests**

```
The following is a raw cybersecurity assessment. Create a nice report using Markdown syntax. You must preserve the meaning of the content. Do not add anything new, focus on the structure.

<raw_assessment>
INSERT DATA HERE
</raw_assessment>
```
