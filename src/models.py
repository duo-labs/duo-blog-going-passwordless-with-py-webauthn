from typing import Optional, List
from dataclasses import dataclass, field

from webauthn.helpers.structs import AuthenticatorTransport


@dataclass
class Credential:
    id: bytes
    public_key: bytes
    sign_count: int
    transports: Optional[List[AuthenticatorTransport]] = None


@dataclass
class UserAccount:
    id: str
    username: str
    credentials: List[Credential] = field(default_factory=list)
