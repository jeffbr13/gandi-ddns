gandi-ddns
==========

Update Gandi DNS with the computer's external IP address.


Usage
-----

### Docker

```sh
docker run --rm --env GANDI_API_KEY=… --env DNS_DOMAIN=… --env DNS_RECORD=… jeffbr13/gandi-ddns
```

### Command Line

```sh
env GANDI_API_KEY=… DNS_DOMAIN=… DNS_RECORD=… ./set-gandi-dns-record.sh
```

### Configuration

The following parameters can be set via environment variables:

- `GANDI_API_KEY`: See [Gandi LiveDNS API docs to get your API key](https://doc.livedns.gandi.net/#step-1-get-your-api-key)
- `DNS_DOMAIN`: e.g. `"example.com"`
- `DNS_RECORD`: e.g. `"@"` or `"subdomain"`
- `DNS_TYPE` (optional): `"A"`
- `DNS_TTL` (optional): `900` seconds


Installation
------------

### Kubernetes

```sh
kubectl create namespace $NAMESPACE
kubectl --namespace=$NAMESPACE create secret generic gandi-livedns-api-key --from-literal=GANDI_API_KEY=$(read -s)
helm install --namespace=$NAMESPACE gandi-ddns --set secretName="gandi-livedns-api-key" --set dnsDomain="…" --set dnsRecord="…"
```