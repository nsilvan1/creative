Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

if IsDuplicityVersion() then -- Server importation
    vRP = Proxy.getInterface("vRP")
    vRPC = Tunnel.getInterface("vRP")

    IMPERIO = {}
    Tunnel.bindInterface("imperio-module", IMPERIO)

    KEYBOARD = Tunnel.getInterface("keyboard")
    IMPERIO_CLIENT = Tunnel.getInterface("imperio-module")
else -- Client importation
    vRP = Proxy.getInterface("vRP")

    IMPERIO = {}
    Tunnel.bindInterface("imperio-module", IMPERIO)

    IMPERIO_SERVER = Tunnel.getInterface("imperio-module")
end
