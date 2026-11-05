# Genera el diagrama de Gantt de la planificación: python3 gantt.py (requiere matplotlib)
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
fases=[("1. Requisitos y alcance",1,2),("2. Diseño UX/UI (Figma)",3,4),("3. Entorno y modelo de datos",4,5),
("4. Lógica de negocio y API",6,9),("5. Frontend (tienda + panel admin)",8,12),("6. Pruebas",13,14),
("7. Beta y aprobación",15,15),("8. Publicación y seguimiento",16,16)]
vino="#5B2333"; claro="#F3E9DC"; gris="#7A6A5A"
fig,ax=plt.subplots(figsize=(12,5),dpi=150)
for i,(n,a,b) in enumerate(fases):
    ax.barh(i,b-a+1,left=a-0.5,height=0.55,color=vino if i<6 else "#9C4A5E",edgecolor=vino)
    ax.text(b+0.6,i,f"S{a}" if a==b else f"S{a}-S{b}",va="center",fontsize=9,color=gris)
ax.set_yticks(range(len(fases))); ax.set_yticklabels([f[0] for f in fases],fontsize=10)
ax.invert_yaxis()
ax.set_xticks(range(1,17)); ax.set_xticklabels([f"S{w}" for w in range(1,17)],fontsize=9)
ax.set_xlim(0.5,17.8); ax.set_ylim(len(fases)-0.3,-1.6)
for s in range(8):
    ax.axvspan(2*s+0.5,2*s+2.5,color=claro if s%2==0 else "white",zorder=0)
    ax.text(2*s+1.5,-1.15,f"Sprint {s+1}",ha="center",fontsize=8.5,color=gris)
    ax.plot(2*s+2.5-0.02,-0.75,marker="v",color=gris,markersize=6)
for w,t in [(1,"40 %"),(12,"40 %"),(16,"20 %")]:
    ax.plot(w,len(fases)-0.45,marker="D",color="#B8862B",markersize=8,clip_on=False)
    ax.text(w+0.25,len(fases)-0.45+0.03,f"Pago {t}",va="center",fontsize=8.5,color="#B8862B",clip_on=False)
for sp in ["top","right","left"]: ax.spines[sp].set_visible(False)
ax.tick_params(axis="y",length=0)
ax.set_title("Cronograma del MVP1 (16 semanas)",fontsize=13,fontweight="bold",color=vino,loc="left")
ax.text(0.5,len(fases)+0.55,"▼ Reunión presencial con el cliente al cierre de cada sprint     ◆ Hito de pago",fontsize=8.5,color=gris)
ax.set_ylim(len(fases)+0.8,-1.6)
plt.tight_layout(); plt.savefig("gantt.png",facecolor="white")
