'use client'

import { useEffect, useMemo, useRef, useState } from 'react'
import { AtSign, Clock3, Moon, Share2, Sparkles, Sun, X } from 'lucide-react'
import { supabase, type Category, type Topic, type CategoryWithTopics } from '@/lib/supabase'

// Interface para los grupos de temas
interface TopicGroup {
  label: string
  icon: string
  topics: string[]
}

// Estado inicial para cuando cargamos desde Supabase
const INITIAL_TOPIC_GROUPS: Record<string, TopicGroup> = {}
const INITIAL_TOPICS: string[] = []

type TopicGroup = keyof typeof INITIAL_TOPIC_GROUPS

let audioContext: AudioContext | null = null

function metallicTick() {
  const AudioContextClass = window.AudioContext || (window as typeof window & { webkitAudioContext?: typeof AudioContext }).webkitAudioContext
  if (!AudioContextClass) return
  
  try {
    // Reutilizar el mismo contexto si existe
    if (!audioContext) {
      audioContext = new AudioContextClass()
    }
    
    // Asegurar que el contexto esté activo
    if (audioContext.state === 'suspended') {
      audioContext.resume()
    }
    
    const oscillator = audioContext.createOscillator()
    const gain = audioContext.createGain()
    oscillator.type = 'square'
    oscillator.frequency.setValueAtTime(1500, audioContext.currentTime)
    oscillator.frequency.exponentialRampToValueAtTime(420, audioContext.currentTime + 0.055)
    gain.gain.setValueAtTime(0.045, audioContext.currentTime)
    gain.gain.exponentialRampToValueAtTime(0.001, audioContext.currentTime + 0.06)
    oscillator.connect(gain).connect(audioContext.destination)
    oscillator.start()
    oscillator.stop(audioContext.currentTime + 0.06)
  } catch (error) {
    console.error('Error playing sound:', error)
  }
}

export function ImpromptuApp() {
  const [topicGroups, setTopicGroups] = useState<Record<string, TopicGroup>>(INITIAL_TOPIC_GROUPS)
  const [allTopics, setAllTopics] = useState<string[]>(INITIAL_TOPICS)
  const [deepTopics, setDeepTopics] = useState<string[]>([])
  const [category, setCategory] = useState<string>('')
  const [categoryOpen, setCategoryOpen] = useState(false)
  const [topic, setTopic] = useState('')
  const [spinning, setSpinning] = useState(false)
  const [mode, setMode] = useState<'improvisado' | 'profundo'>('improvisado')
  const [light, setLight] = useState(false)
  const [timerOpen, setTimerOpen] = useState(false)
  const [shareOpen, setShareOpen] = useState(false)
  const [seconds, setSeconds] = useState(60)
  const [loading, setLoading] = useState(true)
  const timerRef = useRef<number | null>(null)
  
  const categoryTopics = topicGroups[category]?.topics || []
  const currentTopics = mode === 'profundo' ? deepTopics : categoryTopics
  
  const topicIndex = useMemo(() => {
    return currentTopics.indexOf(topic) + 1
  }, [currentTopics, topic])
  
  // Contador contextual según el modo y categoría
  const totalCount = useMemo(() => {
    if (mode === 'profundo') {
      return deepTopics.length
    } else {
      // Para modo improvisado
      if (category === 'todos') {
        // Si es "Todos", mostrar el total de temas de improvisado
        return allTopics.length
      } else {
        // Si es una categoría específica, mostrar solo esa categoría
        return categoryTopics.length
      }
    }
  }, [mode, category, categoryTopics.length, deepTopics.length, allTopics.length])

  // Cargar datos desde Supabase
  useEffect(() => {
    async function loadData() {
      try {
        console.log('Iniciando carga de datos desde Supabase...')
        
        const { data: categories, error: categoriesError } = await supabase
          .from('categories')
          .select('*')
          .order('name')

        if (categoriesError) {
          console.error('Error cargando categorías:', categoriesError)
          throw categoriesError
        }

        console.log('Categorías cargadas:', categories?.length, categories)

        // Cargar temas por categoría individualmente para evitar límites
        const groups: Record<string, TopicGroup> = {}
        const allTopicsList: string[] = []
        for (const cat of categories || []) {
          console.log(`Cargando temas para categoría: ${cat.name} (ID: ${cat.id})`)
          
          const { data: categoryTopics, error: topicsError } = await supabase
            .from('topics')
            .select('title, mode')
            .eq('category_id', cat.id)
            .order('title')

          if (topicsError) {
            console.error(`Error cargando temas para ${cat.name}:`, topicsError)
            continue
          }

          const improvisadoTopics = categoryTopics
            ?.filter((t: Topic) => t.mode === 'improvisado')
            .map((t: Topic) => t.title) || []
          
          const profundoTopicsCount = categoryTopics
            ?.filter((t: Topic) => t.mode === 'profundo').length || 0

          groups[cat.name.toLowerCase()] = {
            label: cat.name,
            icon: cat.icon,
            topics: improvisadoTopics
          }
          
          allTopicsList.push(...improvisadoTopics)
          console.log(`Categoría ${cat.name}: ${improvisadoTopics.length} temas improvisado, ${profundoTopicsCount} temas profundo`)
        }
        
        // Cargar todos los temas de investigación profunda
        const { data: allDeepTopics, error: deepTopicsError } = await supabase
          .from('topics')
          .select('title')
          .eq('mode', 'profundo')
          .order('title')
          .limit(1000)

        if (deepTopicsError) {
          console.error('Error cargando temas de investigación profunda:', deepTopicsError)
        } else {
          const deepTopicsList = allDeepTopics?.map((t: Topic) => t.title) || []
          setDeepTopics(deepTopicsList)
          console.log('Temas de investigación profunda cargados:', deepTopicsList.length)
        }

        // Agregar opción "Todos" manualmente al principio
        if (allTopicsList.length > 0) {
          groups['todos'] = {
            label: 'Todos',
            icon: '✦',
            topics: allTopicsList
          }
          console.log('Categoría Todos:', allTopicsList.length, 'temas')
        }

        console.log('Grupos organizados:', Object.keys(groups))
        console.log('Total temas improvisado:', allTopicsList.length)

        // Debug: mostrar detalles de cada grupo
        Object.entries(groups).forEach(([key, group]) => {
          console.log(`Grupo ${key}:`, group.label, `${group.topics.length} temas`)
        })

        setTopicGroups(groups)
        setAllTopics(allTopicsList)
        
        // Establecer valores iniciales
        const firstCategory = Object.keys(groups)[0]
        console.log('Primera categoría:', firstCategory)
        
        if (firstCategory && groups[firstCategory].topics.length > 0) {
          setCategory(firstCategory)
          setTopic(groups[firstCategory].topics[0])
          console.log('Tema inicial establecido:', groups[firstCategory].topics[0])
        } else {
          // Si no hay temas, establecer estado de error
          console.error('No se encontraron temas en ninguna categoría')
          console.error('Grupos disponibles:', Object.keys(groups))
          setTopic('No hay temas disponibles')
        }
      } catch (error) {
        console.error('Error loading data:', error)
        setTopic('Error al cargar temas')
      } finally {
        setLoading(false)
      }
    }

    loadData()
  }, [])

  // Mantener la tarjeta activa sincronizada con el mazo del modo seleccionado.
  useEffect(() => {
    if (mode === 'profundo' && deepTopics.length > 0) {
      setTopic(deepTopics[0])
    } else if (mode === 'improvisado' && categoryTopics.length > 0) {
      setTopic(categoryTopics[0])
    }
  }, [mode, deepTopics, categoryTopics])

  useEffect(() => {
    setLight(window.localStorage.getItem('impromptu-theme') === 'light')
  }, [])

  useEffect(() => {
    if (!timerOpen || seconds <= 0) return
    timerRef.current = window.setInterval(() => setSeconds((value) => Math.max(0, value - 1)), 1000)
    return () => { if (timerRef.current) window.clearInterval(timerRef.current) }
  }, [timerOpen, seconds])

  function toggleTheme() {
    const next = !light
    setLight(next)
    window.localStorage.setItem('impromptu-theme', next ? 'light' : 'dark')
  }

  async function shareApp() {
    const shareData = { title: 'Impromptu', text: `Practica tu oratoria: ${topic}`, url: window.location.href }
    if (navigator.share) {
      await navigator.share(shareData).catch(() => undefined)
    } else {
      setShareOpen((value) => !value)
    }
  }

  async function spin() {
    if (spinning || loading) return
    setSpinning(true)
    
    // Usar los temas actuales según el modo
    const topicsToUse = mode === 'profundo' ? deepTopics : categoryTopics
    
    if (topicsToUse.length === 0) {
      setSpinning(false)
      return
    }
    
    // Animación rápida y aleatoria igual para ambos modos
    const shuffledTopics = [...topicsToUse].sort(() => Math.random() - 0.5)
    const finalIndex = Math.floor(Math.random() * shuffledTopics.length)
    const finalTopic = shuffledTopics[finalIndex]
    
    // Animación más corta: solo 5-8 pasos en lugar de 25+
    const steps = 5 + Math.floor(Math.random() * 4) // 5-8 pasos aleatorios
    let step = 0
    
    const tick = () => {
      // Mostrar temas aleatorios durante la animación
      const randomIndex = Math.floor(Math.random() * shuffledTopics.length)
      setTopic(shuffledTopics[randomIndex])
      metallicTick()
      step += 1
      
      if (step < steps) {
        // Tiempo más corto entre pasos: 30-50ms en lugar de 55+step*7
        window.setTimeout(tick, 30 + Math.random() * 20)
      } else {
        // Mostrar el tema final
        setTopic(finalTopic)
        metallicTick()
        setTimeout(() => setSpinning(false), 200)
      }
    }
    tick()
  }

  const formatted = `${String(Math.floor(seconds / 60)).padStart(2, '0')}:${String(seconds % 60).padStart(2, '0')}`
  const progress = (seconds / 60) * 360

  return (
    <main className={`impromptu-shell ${light ? 'light-theme' : ''}`}>
      <header className="topbar">
        <div className="brand-block"><h1>IMPROMPTU</h1><p>made by <span><AtSign aria-hidden="true" /> J.C/Yassper</span></p></div>
        <div className="utility-nav" aria-label="Herramientas">
          <button aria-label={light ? 'Activar modo oscuro' : 'Activar modo claro'} onClick={toggleTheme} type="button">{light ? <Sun /> : <Moon />}</button>
          <div className="share-wrap">
            <button aria-expanded={shareOpen} aria-label="Compartir" onClick={shareApp} type="button"><Share2 /></button>
            {shareOpen && <div className="share-menu" role="menu"><button type="button" onClick={() => { window.open(`https://wa.me/?text=${encodeURIComponent(`Practica tu oratoria con Impromptu: ${window.location.href}`)}`, '_blank'); setShareOpen(false) }}>WhatsApp</button><button type="button" onClick={() => { window.open(`mailto:?subject=Impromptu&body=${encodeURIComponent(window.location.href)}`, '_blank'); setShareOpen(false) }}>Email</button><button type="button" onClick={() => { void navigator.clipboard?.writeText(window.location.href); setShareOpen(false) }}>Copiar enlace</button></div>}
          </div>
        </div>
      </header>

      <section className="practice-area" aria-labelledby="practice-title">
        <div className="mode-toggle" role="group" aria-label="Modo de práctica">
          <button className={mode === 'improvisado' ? 'active' : ''} onClick={() => setMode('improvisado')} type="button">Improvisado</button>
          <button className={mode === 'profundo' ? 'active' : ''} onClick={() => setMode('profundo')} type="button">Investigación profunda</button>
        </div>
        <p className="intro" id="practice-title">{mode === 'improvisado' ? 'Elige un universo y deja que el azar te dé la palabra.' : 'Tómate 15 minutos para aprender y luego explícalo en 1 minuto.'}</p>
        {mode === 'improvisado' && <div className="category-picker" aria-label="Categoría de temas">
          <label className="category-label" htmlFor="topic-category">Temas</label>
          <div className="category-select-wrap">
            <button id="topic-category" className="category-select-trigger" type="button" disabled={spinning || loading} aria-haspopup="listbox" aria-expanded={categoryOpen} aria-label="Seleccionar categoría de temas" onClick={() => setCategoryOpen((value) => !value)}>
              <span className="category-select-icon" aria-hidden="true">{topicGroups[category]?.icon || '◌'}</span>
              <span>{topicGroups[category]?.label || 'Cargando...'}</span>
              <span className="category-chevron" aria-hidden="true">⌄</span>
            </button>
            {categoryOpen && <div className="category-menu" role="listbox" aria-label="Categorías disponibles">
              {Object.entries(topicGroups).map(([key, group]) => (
                <button 
                  key={key} 
                  className={category === key ? 'category-option selected' : 'category-option'} 
                  type="button" 
                  role="option" 
                  aria-selected={category === key} 
                  onClick={() => { setCategory(key); setTopic(group.topics[0] || ''); setCategoryOpen(false) }}
                >
                  <span aria-hidden="true">{group.icon}</span>
                  <span>{group.label}</span>
                  {category === key && <span className="category-check" aria-hidden="true">✓</span>}
                </button>
              ))}
            </div>}
          </div>
        </div>}
        <div className={`deck-stage ${spinning ? 'is-running' : ''}`} aria-live="polite">
          {loading ? (
            <div className="loading-state">Cargando temas...</div>
          ) : (
            <>
              <div className="ghost-card ghost-top"><span>{currentTopics[(topicIndex + 1) % currentTopics.length]}</span></div>
              <div className="ghost-card ghost-bottom"><span>{currentTopics[(topicIndex + 2) % currentTopics.length]}</span></div>
              <div className="side-arrow" aria-hidden="true">›</div>
              <article className="topic-card">
                <div className="card-meta">
                  <span>{mode === 'improvisado' ? topicGroups[category]?.label.toUpperCase() : 'INVESTIGACIÓN PROFUNDA'}</span>
                  <span>{topicIndex} / {totalCount}</span>
                </div>
                <h2>{topic}</h2>
                <div className="card-footer"><span>IMPROMPTU</span><span>··</span></div>
              </article>
              <aside className="annotation"><strong>PIENSA EN 30s</strong><br /><span className="annotation-line">DILO EN 1m</span> <span aria-hidden="true">↙</span></aside>
            </>
          )}
        </div>
        <div className="actions">
          <button className="spin-button" disabled={spinning || loading} onClick={spin} type="button">
            <Sparkles aria-hidden="true" /> {spinning ? 'Bajando…' : topicIndex === 2 ? 'Girar el mazo' : 'Girar de nuevo'}
          </button>
          <button className="timer-button" onClick={() => { setSeconds(60); setTimerOpen(true) }} type="button">
            <Clock3 aria-hidden="true" /> Timer 1 min
          </button>
        </div>
      </section>

      {timerOpen && <div className="timer-overlay" role="dialog" aria-modal="true" aria-label="Temporizador de oratoria"><button className="close-timer" aria-label="Cerrar temporizador" onClick={() => setTimerOpen(false)} type="button"><X /></button><div className="timer-label">{mode === 'profundo' ? 'INVESTIGACIÓN PROFUNDA' : 'ORATORIA'}</div><h2>{topic}</h2><div className="timer-dial" style={{ '--progress': `${progress}deg` } as React.CSSProperties}><div className="timer-dial-inner"><strong>{formatted}</strong></div></div><p>{seconds === 0 ? 'Tiempo.' : 'Hablá.'}</p><button className="timer-close-link" onClick={() => setTimerOpen(false)} type="button">Cerrar</button></div>}
      <footer><span>© 2026 Impromptu. Todos los derechos reservados.</span><span className="idea-credit">Idea de Francisco Annoni</span></footer>
    </main>
  )
}
