<%inherit file="${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="clldmpgutil" file="clldmpg_util.mako"/>
<%namespace name="util" file="util.mako"/>

<h3>Downloads</h3>
<p>
  Please find here the list of the underlying datasets and their access URLs:
</p>
<table>
  <thead style="border-bottom:1px solid lightgray"><td>ID</td><td>Name (URL)</td><td>Version</td></thead>
  % for p in u.get_contributions(False):
  <tr>
    <td>${p.id}</td>
    <td>${h.external_link(url=p.accessURL, label=p.name, target="_new")}</td>
    % if p.version.find(' ') > -1:
      <td><i>accessed: ${p.version}</i></td>
    % else:
      <td>${p.version}</td>
    % endif
  </tr>
  % endfor
</table>
