import getReadingTime from 'reading-time'
import { toString } from 'mdast-util-to-string'

/**
 * Injects `minutesRead` into frontmatter processed by Remark in Russian.
 */
export function remarkReadingTime() {
	return function (tree: unknown, { data }: any) {
		const textOnPage = toString(tree)
		const readingTime = getReadingTime(textOnPage)

		// Берём число минут (округляем вверх)
		const minutes = Math.ceil(readingTime.minutes)

		// Формируем строку на русском
		const minutesText = `${minutes} мин чтения`

		// Сохраняем в frontmatter
		data.astro.frontmatter.minutesRead = minutesText
	}
}
