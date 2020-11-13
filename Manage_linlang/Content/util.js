function obj2UrlParam(obj) {
    let s = "";
    Object.keys(obj).forEach(k => {
        if (obj[k] instanceof Object)
            s += k + '=' + JSON.stringify(obj[k]) + '&';
        else
        s += k + '=' + obj[k] +'&';
    })
    return s.substr(0, s.length - 1);

}