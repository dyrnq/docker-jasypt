# docker-jasypt


## listAlgorithms.sh

```bash
docker run -it --rm dyrnq/jasypt:1.9.3 listAlgorithms.sh
```

```bash
DIGEST ALGORITHMS:   [MD2, MD5, SHA-1, SHA-224, SHA-256, SHA-384, SHA-512, SHA-512/224, SHA-512/256, SHA3-224, SHA3-256, SHA3-384, SHA3-512]

PBE ALGORITHMS:      [PBEWITHHMACSHA1ANDAES_128, PBEWITHHMACSHA1ANDAES_256, PBEWITHHMACSHA224ANDAES_128, PBEWITHHMACSHA224ANDAES_256, PBEWITHHMACSHA256ANDAES_128, PBEWITHHMACSHA256ANDAES_256, PBEWITHHMACSHA384ANDAES_128, PBEWITHHMACSHA384ANDAES_256, PBEWITHHMACSHA512/224ANDAES_128, PBEWITHHMACSHA512/224ANDAES_256, PBEWITHHMACSHA512/256ANDAES_128, PBEWITHHMACSHA512/256ANDAES_256, PBEWITHHMACSHA512ANDAES_128, PBEWITHHMACSHA512ANDAES_256, PBEWITHMD5ANDDES, PBEWITHMD5ANDTRIPLEDES, PBEWITHSHA1ANDDESEDE, PBEWITHSHA1ANDRC2_128, PBEWITHSHA1ANDRC2_40, PBEWITHSHA1ANDRC4_128, PBEWITHSHA1ANDRC4_40]
```

## encrypt.sh
```bash
docker run -it --rm dyrnq/jasypt:1.9.3 encrypt.sh

USAGE: encrypt.sh [ARGUMENTS]

  * Arguments must apply to format:

      "arg1=value1 arg2=value2 arg3=value3 ..."

  * Required arguments:

      input
      password

  * Optional arguments:

      verbose
      algorithm
      keyObtentionIterations
      saltGeneratorClassName
      providerName
      providerClassName
      stringOutputType
      ivGeneratorClassName
```

```bash
docker run -it --rm dyrnq/jasypt:1.9.3 encrypt.sh \
input="root" \
password="docker@&&&A007!" \
verbose=false \
algorithm="PBEWITHHMACSHA512ANDAES_256" \
ivGeneratorClassName="org.jasypt.iv.RandomIvGenerator" \
saltGeneratorClassName="org.jasypt.salt.RandomSaltGenerator"
```
## decrypt.sh

```bash
docker run -it --rm dyrnq/jasypt:1.9.3 decrypt.sh

USAGE: decrypt.sh [ARGUMENTS]

  * Arguments must apply to format:

      "arg1=value1 arg2=value2 arg3=value3 ..."

  * Required arguments:

      input
      password

  * Optional arguments:

      verbose
      algorithm
      keyObtentionIterations
      saltGeneratorClassName
      providerName
      providerClassName
      stringOutputType
      ivGeneratorClassName
```

```bash
docker run -it --rm dyrnq/jasypt:1.9.3 decrypt.sh \
input="/UYHVZx4596WxIZdLpcKJsGTllrFYJ+sXjvxTDjQ/3GMlSXQR9JnjMWE/jdbiTXC" \
password="docker@&&&A007!" \
verbose=false \
algorithm="PBEWITHHMACSHA512ANDAES_256" \
ivGeneratorClassName="org.jasypt.iv.RandomIvGenerator" \
saltGeneratorClassName="org.jasypt.salt.RandomSaltGenerator"
```

## digest.sh

```bash
docker run -it --rm dyrnq/jasypt:1.9.3 digest.sh \
input="hello" \
verbose=false \
algorithm=MD5
```

- <https://github.com/dyrnq/docker-jasypt>
- <https://github.com/jasypt/jasypt>
- <https://github.com/jasypt/jasypt/tree/master/jasypt-dist/src/main/bin>