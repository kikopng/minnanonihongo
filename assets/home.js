fetch('lessons/course.json').then(r=>{if(!r.ok)throw Error();return r.json()}).then(course=>{
  const ready=course.lessons.filter(l=>l.status==='ready').length;
  document.querySelector('#course-progress').textContent=`${ready} / ${course.lessons.length} ready`;
  document.querySelector('#course-bar').style.width=`${ready/course.lessons.length*100}%`;
  document.querySelector('#lesson-grid').innerHTML=course.lessons.map(l=>{
    const open=l.status==='ready'; const destination=(l.id===1 || l.id===15 || l.id===16)?`Exercise.htm?lesson=${l.id}`:`lesson.html?lesson=${l.id}`;
    return `<${open?'a href="'+destination+'"':'div'} class="lesson-card ${open?'ready':'soon'}"><span class="lesson-number">LESSON ${String(l.id).padStart(2,'0')}</span><h3>${l.title}</h3><span class="pill">${open?(l.legacy?'Arcade ready':'Ready to study'):'Coming soon'}</span></${open?'a':'div'}>`;
  }).join('');
}).catch(()=>document.querySelector('#lesson-grid').textContent='Could not load the course list.');
