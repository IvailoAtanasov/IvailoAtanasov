# Statements
{% ... %}
# i.e (for, if)

# Expressions 
{{ ... }}
# i.e. (print)

# Comments
{# ... #}


sample_password_state:
  user.present:
    -home: /home/username
      -password: {{ salt.pillat.get('ps-passwd', 'default-password') }} # adding default value will prevent failure if parameter is missing
      
# Escape curly braces
#Input                                      Output
{{ '{{'}} In Braces {{'}}' }}               {{ In Braces }}
{% raw %}
  {% for item in itemlist %}                {% for item in itemlist %}
    Here is the {{ item }}                    Here is the {{ item }}
  {% endfor %}                              {% endfor %}
{% endraw %}

# Looping over a list
{% set user_list = ['user1', 'user2', 'user3'] %}
  {% for user in user_list %}
    user:
      user.present
  {% endfor %}
  
  
# Iterate over dict
# Pillar dict                             
user-list:
  - name: azami
  - pass: sample_pass_1
  - shell: /bin/bash
  - name: malik
  - pass: sample_pass_2
  - shell: /bin/bash
  - name: zahara
  - pass: sample_pass_3
  - shell: /bin/bash
  
# State with jinja
{% for user in pillar['user-list'] %}
  {{ user.name }}:
    user.present:
      - password: {{ user.pass}}
      - home: /home/{{ user.name}}
      - shell: {{ user.shell }}
{% endfor %}




































