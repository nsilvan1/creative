Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

if IsDuplicityVersion() then -- Server imports
    vRP = Proxy.getInterface("vRP")
    vRPC = Tunnel.getInterface("vRP")

    IMPERIO = {}
    Tunnel.bindInterface("imperio-works", IMPERIO)
    
    KEYBOARD = Tunnel.getInterface("keyboard")
    IMPERIO_CLIENT = Tunnel.getInterface("imperio-works")
else -- Client imports
    vRP = Proxy.getInterface("vRP")
    vRPS = Tunnel.getInterface("vRP")

    IMPERIO = {}
    Tunnel.bindInterface("imperio-works", IMPERIO)

    IMPERIO_SERVER = Tunnel.getInterface("imperio-works")
end