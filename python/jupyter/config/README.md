### Main

- version 3.0 doesn't work yet with extensions
- `pip install jupyterlab==2.2.8`
- config directories
  - `~/.ipython`
  - `~/.jupyter`
- `jupyter lab --generate-config`
- `jupyter --path` to see the config, data and runtime paths

### Extensions

- `jupyter labextension list`
- `jupyter serverextension list`

### Installs

Dracula

```
jupyter labextension install @karosc/jupyterlab_dracula
Settings -> JupyterLab Theme -> Dracula
```

Variable Inspector

```
jupyter labextension install @lckr/jupyterlab_variableinspector
```

LSP

```
pip install jupyter-lsp
jupyter labextension install @krassowski/jupyterlab-lsp
pip install python-language-server[all]
```

Templates

```
pip install jupyterlab_templates
jupyter labextension install jupyterlab_templates
jupyter serverextension enable --py jupyterlab_templates

vi /home/chyld/.jupyter/jupyter_notebook_config.py

c.JupyterLabTemplates.template_dirs = ['/home/chyld/Code/devops/python/jupyter/templates']
c.JupyterLabTemplates.include_default = False
c.JupyterLabTemplates.include_core_paths = False
```
