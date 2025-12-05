import VkIcon from '../components/icons/VkIcon.astro'
import TelegramIcon from '../components/icons/TelegramIcon.astro'

// Массив социальных сетей
export const SOCIALNETWORKS = [
	{
		name: 'VK',
		url: 'https://vk.com/',
		icon: VkIcon
	},
	{
		name: 'Telegram',
		url: 'https://t.me/',
		icon: TelegramIcon
	}
] as const
