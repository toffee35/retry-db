from asyncio import AbstractEventLoop

from granian.rsgi import Scope, HTTPProtocol


class Main:
    @staticmethod
    def __rsgi_init__(loop: AbstractEventLoop) -> None:
        pass

    @staticmethod
    async def __rsgi__(scope: Scope, protocol: HTTPProtocol) -> None:
        pass

    @staticmethod
    def __rsgi_del__(loop: AbstractEventLoop) -> None:
        pass
