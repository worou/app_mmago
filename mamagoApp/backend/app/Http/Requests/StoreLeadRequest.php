<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreLeadRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    /**
     * @return array<string, mixed>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:120'],
            'email' => ['required', 'email:rfc', 'max:180'],
            'phone' => ['nullable', 'string', 'max:30'],
            'message' => ['nullable', 'string', 'max:2000'],
            'country_id' => [
                'nullable',
                // Only real countries are selectable — the "Et plus encore"
                // tile is a display placeholder, not a valid choice.
                Rule::exists('countries', 'id')->where('is_placeholder', false),
            ],
            'source' => ['nullable', Rule::in(['contact', 'download'])],
        ];
    }

    /**
     * Resolved through the translator, so an English page gets English errors.
     * The locale comes from the SetLocale middleware.
     */
    public function messages(): array
    {
        return [
            'name.required' => __('validation.lead.name_required'),
            'email.required' => __('validation.lead.email_required'),
            'email.email' => __('validation.lead.email_invalid'),
            'country_id.exists' => __('validation.lead.country_unknown'),
            'message.max' => __('validation.lead.message_too_long'),
        ];
    }
}
