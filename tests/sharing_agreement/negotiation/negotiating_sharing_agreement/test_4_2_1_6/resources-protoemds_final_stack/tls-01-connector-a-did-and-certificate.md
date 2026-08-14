# TLS-01: connector-a DID and certificate validation

| Field | Observed value |
| --- | --- |
| Capture date | 2026-08-13 |
| Connector DID | `did:web:connector-a.194-164-194-95.sslip.io` |
| DSP endpoint advertised by DID document | `https://connector-a.194-164-194-95.sslip.io/api/dsp` |
| Certificate subject | `CN=connector-a.194-164-194-95.sslip.io` |
| Certificate issuer | `C=US, O=Let's Encrypt, CN=YR1` |
| TLS protocol | `TLSv1.3` |
| Cipher | `TLS_AES_256_GCM_SHA384` |
| Hostname and chain verification | `Verify return code: 0 (ok)` |
| Plaintext DSP result | `HTTP 308` redirect to the HTTPS DSP endpoint |

## Collection method

```sh
curl --fail --silent --show-error \
  https://connector-a.194-164-194-95.sslip.io/.well-known/did.json
openssl s_client \
  -connect connector-a.194-164-194-95.sslip.io:443 \
  -servername connector-a.194-164-194-95.sslip.io \
  -verify_hostname connector-a.194-164-194-95.sslip.io \
  -verify_return_error </dev/null
curl --head --silent --show-error --output /dev/null \
  --write-out 'HTTP %{http_code} redirect=%{redirect_url}\n' \
  http://connector-a.194-164-194-95.sslip.io/api/dsp
```

The DID document also exposed a public credential-service endpoint. It is intentionally omitted because it is not required for this test.
