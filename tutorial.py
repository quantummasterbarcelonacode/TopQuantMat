import sys
sys.path.append("/content/conda_dir")
import kwant
import qsymm
import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
from numpy.random import random
welcome="Packages are loaded. ¡Welcome!"

euler = (sp.Symbol("e"),sp.exp(1));
def Rz(phi):
  return sp.Matrix([  [ sp.cos(phi),-sp.sin(phi), 0 ],
                      [ sp.sin(phi), sp.cos(phi), 0 ],
                      [ 0            , 0        , 1 ]
                    ]);


def FirstOrderTaylor( h, x,x0 ):
    dx   = x; evalx=  list(zip(x,x0));
    h=h.expand(complex=True)
    happ = h.subs( evalx );    
    for xi,dxi in zip(x,dx):
        happ += sp.diff(h,xi).subs(evalx)*dxi;
    return sp.simplify(happ);

class Hexagonal:
  lat_vec= sp.Array( [
            [sp.Rational( 1,2), sp.sqrt(3)/2,sp.Integer(0)],
            [sp.Rational(-1,2), sp.sqrt(3)/2,sp.Integer(0)],
            [sp.Integer(0),sp.Integer(0),sp.Integer(1)] 
         ]);

  rec_vec = sp.Array( sp.Matrix(lat_vec).inv().T*2*sp.pi );


graphene = Hexagonal();

import requests
import IPython.display as Disp
grafeno_real = 'https://i.pinimg.com/564x/27/73/60/277360f8a8265b0a8008d1d03023a7be.jpg'
grafeno_disp = 'https://icn2.cat/images/20190802_spin-communication.jpg'
def ejemplo_grafeno_real():
  return Disp.Image(requests.get(grafeno_real).content);
def ejemplo_dispositivo_grafeno():
  return Disp.Image(requests.get(grafeno_disp).content);
